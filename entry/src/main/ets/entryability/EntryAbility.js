import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
export default class EntryAbility extends UIAbility {
    onCreate(want, launchParam) {
        hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    }
    onDestroy() {
        hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
    }
    onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability
        hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');
        windowStage.loadContent('pages/Index', (err, data) => {
            var _a, _b;
            if (err.code) {
                hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', (_a = JSON.stringify(err)) !== null && _a !== void 0 ? _a : '');
                return;
            }
            hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', (_b = JSON.stringify(data)) !== null && _b !== void 0 ? _b : '');
        });
        windowStage.getMainWindow((err, data) => {
            if (err.code) {
                console.error('Failed to obtain the main window. Cause: ' + JSON.stringify(err));
                return;
            }
            let windowClass = data;
            let names = [];
            windowClass.setWindowSystemBarEnable(names, (err) => {
                if (err.code) {
                    console.error('Failed to set the system bar to be visible. Cause:' + JSON.stringify(err));
                    return;
                }
                console.info('Succeeded in setting the system bar to be visible.');
            });
        });
    }
    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
    }
    onForeground() {
        // Ability has brought to foreground
        hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
    }
    onBackground() {
        // Ability has back to background
        hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
    }
}
//# sourceMappingURL=EntryAbility.js.map