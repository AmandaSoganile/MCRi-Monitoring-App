# MCRI Monitoring App

A platform to assist MCRI personnel with creating weekly reports, made to automate the process of sending reports

## Description

- The app allows facilitator and students to be able to add details weekly which automatically creates the reports that facilitators send to management and partnering companies.
- Users can check student performance and how they are keeping up.
- Users can view how many goals have been met
- Compatible on macOS 26.0+ and iOS 26.0+
- SwiftUI is used for the user interface of the app.

## Requirements

- Xcode 15.0 or later
- iOS 26.0+ / macOS 26.0+
- Swift 5.9+

## Setup Instructions

1. **Clone the repository**
   ```bash
   git clone https://github.com/AmandaSoganile/MCRi-Monitoring-App.git
   cd MCRI Monitoring App
   ```

2. **Open the project**
   - Open `MCRI Monitoring App.xcodeproj` in Xcode

2. **Install dependencies** (if using SPM, CocoaPods, or Carthage)
   - For Swift Package Manager: Dependencies should resolve automatically
   - For CocoaPods: Run `pod install`
   - For Carthage: Run `carthage update`

4. **Configure signing**
   - Select your development team in the project settings
   - Update the bundle identifier if needed

5. **Build and run**
   - Select your target device or simulator
   - Press `Cmd + R` to build and run the project

## Project Structure

```
YourProject/
├── App/
│   └──MCRI_Monitoring_AppApp.swift
├── Auth/
│   ├──Onboarding
│     ├──BottomControls.swift
│     ├──OnboardingPage.swift
│   ├──LoginView.swift
│   ├──RegisterView.swift
│   └──WelcomeView.swift
├── CompletedMilestones/
│   ├──CompletedMilestones.swift
│   ├──Milestone.swift
│   ├──MilstoneCard.swift
│   └──NewMilestone.swift
├── Dashboard/
│   ├──DashboardBlock.swift
│   ├──DashboardView.swift
│   └──KPIItem.swift
├── Goals/
│   ├──CreateGoalView.swift
│   ├──EditGoalView.swift
│   └──GoalsView.swift
├── HelpRequests/
│   └──Requests.swift
├── Logic/Users/
│   ├──MinimumUsers.swift
│   └──User.swift
├── StudentPerformance/
│   ├──CohortCategorieView.swift
│   ├──EditView.swift
│   ├──SeeOnlyView.swift
│   ├──SingleStudentView.swift
│   └──StudentPerfrmanceView.swift
├── Updates/
│   ├──HorizontalWeekView.swift
│   ├──PickStudentView.swift
│   ├──PickWeekManager.swift
│   ├──UpdateCard.swift
│   ├──managerUpdateCard.swift
│   ├──managerUpdates.swift
│   ├──studentUpdates.swift
│   └──updateStruct.swift
├── Settings/
│   ├──AboutTheApp.swift
│   ├──Notifications.swift
│   ├──PasswordPage.swift
│   ├──ProfileDetails.swift
│   ├──Settings page.swift
│   └──Support.swift
└── Resources/
    └── Assets.xcassets
```

## Features

- **Secure Authentication**: Users can experience peace of mind with a secure sign-in and sign-up process, ensuring all reports are safe. Users are able to choose their role at MCRI.
- **Separate views for facilitators, students and companies**: Users are able to access information relevant to their access level allowing for security and making sure not everyone can edit very important information.
- **Goals**: Users can add goals and check their progress in real time as well as see completed goals how much time was taken to complete them.
- **Automatic Reports**: Users add information and reports can be automatically generated.
## Notes

- **Known Issues**: Student progress is not persisted when you leave the page hence no information is stored.

   No backend hence no user data is stored

- **Future Improvements**: 
  Creating a functional backend for the application.

  Improve the User Interface to be uniform.

  Using UserDefaults to properly access the the different views.

## Contact

Amanda - [@AmandaSoganile](www.linkedin.com/in/amanda-soganile-8237ba365) - soganileamanda@gmail.com

Project Link: [https://github.com/AmandaSoganile/MCRi-Monitoring-App](https://github.com/AmandaSoganile/MCRi-Monitoring-App)
