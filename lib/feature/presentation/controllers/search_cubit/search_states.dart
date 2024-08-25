abstract class SearchStates {}

class SearchInitialState extends SearchStates {}

/// Search list
class SearchLoadingState extends SearchStates {}

class SearchSuccessState extends SearchStates {}

class SearchErrorState extends SearchStates {}