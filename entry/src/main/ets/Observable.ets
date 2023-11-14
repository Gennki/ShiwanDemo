import { Observer } from './Observer';

export class Observable<T> {
  private observers: Observer<T>[] = [];

  constructor(private _value: T) {
  }

  get value(): T {
    return this._value;
  }

  set value(value: T) {
    this._value = value;
    this.notifyAll();
  }

  addObserver(consumer: any, observer: (value: T) => void): void {
    this.observers.push(new Observer(consumer, observer));
  }

  removeObserver(consumer: any): void {
    this.observers = this.observers.filter(observer => observer.consumer !== consumer);
  }

  private notifyAll(): void {
    for (const observer of this.observers) {
      observer.callback(this.value);
    }
  }
}

