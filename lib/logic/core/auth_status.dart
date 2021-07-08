// Authentication state extension and enum to maintain the app auth states
enum AuthStatus {
  initial,
  submissionInProgress,
  submissionSuccess,
  submissionFailure,
  nextPage,
}

extension AuthStatusExtension on AuthStatus {
  bool get isSubmissionInProgress => this == AuthStatus.submissionInProgress;
  bool get isSubmissionSuccess => this == AuthStatus.submissionSuccess;
  bool get isSubmissionFailure => this == AuthStatus.submissionFailure;
  bool get nextPageClicked => this == AuthStatus.nextPage;
}
