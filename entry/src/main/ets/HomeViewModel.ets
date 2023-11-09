import { createViewModelByApp, ViewModel } from './ViewModel';

class HomeViewModel extends ViewModel {

  private classification: string[] = ['肉禽', '蔬菜', '水产', '五谷', '净菜', '料包', '烹饪历史', '自创菜谱']
}

const vm = createViewModelByApp(HomeViewModel)