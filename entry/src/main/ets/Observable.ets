import { Observer } from './Observer';

export class Observable<T> {
  private observers: Observer<T>[] = [];

  constructor(private state: T) {
  }

  getState(): T {
    return this.state;
  }

  setState(state: T): void {
    this.state = state;
    this.notifyAll();
  }

  addObserver(consumer: any, observer: (state: T) => void): void {
    this.observers.push(new Observer(consumer, observer));
  }

  removeObserver(consumer: any): void {
    this.observers = this.observers.filter(observer => observer.consumer !== consumer);
  }

  private notifyAll(): void {
    for (const observer of this.observers) {
      observer.callback(this.state);
    }
  }
}

