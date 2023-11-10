export class ViewModel {
}

const appMap = {}
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

export function createViewModelByEntry<VM extends ViewModel>(ViewModelClass: new () => VM): VM {
  let viewModel: VM;
  const storage = LocalStorage.GetShared();
  if (storage.has(ViewModelClass.name)) {
    viewModel = storage.get(ViewModelClass.name)
  } else {
    viewModel = new ViewModelClass();
    storage.setOrCreate(ViewModelClass.name, viewModel)
  }
  return viewModel
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