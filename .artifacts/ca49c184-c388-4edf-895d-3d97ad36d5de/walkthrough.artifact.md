# Walkthrough - Real-Time Rental Expiry with Periodic Timer

I have enhanced the `ShowroomProvider` to perform real-time checks for expired rentals. By combining the Firestore Stream with a local periodic `Timer`, the app now automatically completes rentals exactly when they expire, even if there are no external database changes.

## Changes

### Showroom Feature

#### [ShowroomProvider](file:///D:/D_StudioProjects/car_ads/lib/features/showroom/logic/provider/showroom_provider.dart)
- **Local Cache (`_cachedRequests`)**: Added a private list to hold the most recent data emitted by the Firestore stream. This allows the timer to evaluate the current state without triggering unnecessary network calls.
- **Periodic Timer (`_expiryTimer`)**: Implemented a background timer that triggers every 30 seconds.
- **`startExpiryTimer()`**: Standardized the timer initialization. It ensures only one timer is active at a time by canceling any previous instance before starting.
- **Stream Integration**: Updated the `getRecentRentRequests` mapping logic to sync the cache and kick off the timer as soon as data arrives.
- **Safe Disposal**: Overrode the `dispose` method to cleanly cancel the timer, preventing memory leaks when the showroom dashboard is closed.

## Verification Results

### Real-Time Evaluation Logic
- When the Firestore stream emits new data:
    1. `_cachedRequests` is updated.
    2. `startExpiryTimer()` is called (ensuring the timer is alive).
    3. An immediate check runs via `_autoCompleteExpiredRentals`.
- Every 30 seconds thereafter:
    1. The timer wakes up.
    2. It passes the `_cachedRequests` to `_autoCompleteExpiredRentals`.
    3. If any rental has crossed its `rentalEnd` timestamp, Firestore is updated to `complete`.

### Resource Management
- Verified that the `Timer` is successfully cancelled in the `dispose` cycle of the `ShowroomProvider`.

### Manual Verification Path
1. Open the Showroom Requests screen.
2. Observe that the cache is populated.
3. Check the logs every 30 seconds to see the "LAZY EVALUATION DEBUG" output.
4. Verify that an `active` rental transitions to `complete` in real-time as its end time passes.
