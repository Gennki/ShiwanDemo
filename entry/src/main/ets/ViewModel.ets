export class ViewModel {
}

const appMap = {}
const entryMap = {}
const componentMap = {}

export function createViewModelByApp<VM extends ViewModel>(ViewModelClass: new () => VM): VM {
  let viewModel;
  if (!appMap.hasOwnProperty(ViewModelClass.name)) {
    viewModel = new ViewModelClass();
    appMap[ViewModelClass.name] = viewModel;
  } else {
    viewModel = appMap[ViewModelClass.name]
  }
  return viewModel;
}

export function createViewModelByEntry<VM extends ViewModel>(caller: any, ViewModelClass: new () => VM): VM {
  let viewModel;
  if (!entryMap.hasOwnProperty(ViewModelClass.name)) {
    viewModel = new ViewModelClass();
    entryMap[ViewModelClass.name] = viewModel;
  } else {
    viewModel = entryMap[ViewModelClass.name]
  }
  return viewModel;
}

export function createViewModelByComponent<VM extends ViewModel>(caller: any, ViewModelClass: new () => VM): VM {
  let viewModel;
  if (!componentMap.hasOwnProperty(ViewModelClass.name)) {
    viewModel = new ViewModelClass();
    componentMap[ViewModelClass.name] = viewModel;
  } else {
    viewModel = componentMap[ViewModelClass.name]
  }
  return viewModel;
}