// ignore: file_names
abstract class BaseViewModel extends BaseViewModelInputs
    implements BaseViewModelOutputs {
  // shared varibles and functions that will be used through any view model.
}

abstract class BaseViewModelInputs {
  void start(); // will be called while init. of view model
  void dispose(); // will be called when viewmodel dies.
}

abstract class BaseViewModelOutputs {}
