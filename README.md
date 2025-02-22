### TechXplore Team 15 IOS
This is a mobile application designed to help users manage their banking subscriptions. The app allows users to easily track and manage their subscriptions, receive notifications for upcoming payments, and set restrictions on their accounts. It enables users to keep track of their subscriptions, add transactions to them, and stay informed with relevant alerts.

## Features

- **Add Transactions to Subscriptions:**  
  Users can add transactions from their bank accounts to manage subscriptions, ensuring they never miss a payment.

- **Subscription Management:**  
  View, edit, and delete subscriptions with details like subscriber name, account number, payment day, end date, and status.

- **Notifications & Alerts:**  
  Receive timely notifications about upcoming subscription payments, ensuring users can always keep track of their spending.

## Technologies Used

- **SwiftUI**  
   for building the user interface.

- **URLSession**  
   to handle network requests and interact with RESTful APIs.

- **MVVM (Model-View-ViewModel)**  
   architecture to separate concerns and maintain scalable, testable code.

  The app interacts with a remote API to fetch and manage subscription data. If you'd like to set up your own backend or modify the current one, make sure to configure the correct API endpoints and adjust network request handling in the ViewModel.

## API Endpoints:

- **GET /subscriptions:**  
   Fetch all subscriptions for the authenticated user.

- **POST /subscriptions:**  
   Add a new subscription.
