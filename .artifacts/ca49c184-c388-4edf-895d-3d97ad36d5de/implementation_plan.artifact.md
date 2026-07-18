# Real-Time Rental Expiry with Periodic Timer

We are implementing a real-time expiry check for rental requests using a combination of Firestore Streams and a local `Timer.periodic`. This ensures that expired rentals are automatically marked as `complete` even if the stream hasn't emitted new data.

## User Review Required

> [!IMPORTANT]
> - The `ShowroomProvider` will now maintain a `_cachedRequests` list representing the latest state from the Firestore stream.
> - A background timer will run every 30 seconds to evaluate this cache and update Firestore if necessary.
> - This logic is "lazy" but triggered periodically, ensuring high data accuracy during active user sessions.

## Proposed Changes

### Showroom Feature

#### [MODIFY] [showroom_provider.dart](file:///D:/D_StudioProjects/car_ads/lib/features/showroom/logic/provider/showroom_provider.dart)
- Add `import 'dart:async';`.
- Declare `Timer? _expiryTimer` and `List<RentRequestModel> _cachedRequests`.
- Update `getRecentRentRequests`: In the stream's `map` function, update `_cachedRequests` with the latest data and ensure the timer is started.
- Implement `startExpiryTimer()`: Cancels any existing timer and starts a 30-second periodic timer that calls `_autoCompleteExpiredRentals(_cachedRequests)`.
- Update `dispose()`: Safely cancel the `_expiryTimer`.

## Verification Plan

### Automated Logic Check
- Verify that `_cachedRequests` is updated every time the Firestore stream emits.
- Verify that `_autoCompleteExpiredRentals` is called with the latest cached data.

### Manual Verification Path
1. Log in as a showroom owner.
2. Observe the debug logs (added in the previous task) to see the periodic check running every 30 seconds.
3. Allow a rental period to expire while the app is open.
4. Verify the status changes to **COMPLETE** automatically in the UI and database.
