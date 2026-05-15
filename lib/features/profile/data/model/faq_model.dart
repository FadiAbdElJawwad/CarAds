class FAQModel {
  final String question;
  final String answer;

  FAQModel({required this.question, required this.answer});
}

List<FAQModel> faqData = [
  FAQModel(
    question: 'How do I book a car?',
    answer: 'You can book a car by browsing our car listings, selecting a car that fits your needs, and following the checkout process to confirm your rental.',
  ),
  FAQModel(
    question: 'What documents are required for rental?',
    answer: 'Typically, you will need a valid driving license, a national ID or passport, and in some cases, a credit card for the security deposit.',
  ),
  FAQModel(
    question: 'Can I cancel my booking?',
    answer: 'Yes, bookings can be cancelled through the history section. Please review our cancellation policy for information on potential fees.',
  ),
  FAQModel(
    question: 'Is insurance included?',
    answer: 'Most rentals include basic insurance. You can opt for additional coverage during the checkout process for extra peace of mind.',
  ),
  FAQModel(
    question: 'How do I contact customer support?',
    answer: 'You can reach our support team via the contact details provided in the app or through the support section in your profile.',
  ),
];
