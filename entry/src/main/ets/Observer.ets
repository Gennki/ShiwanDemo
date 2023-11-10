export class Observer<T> {
  constructor(public consumer: any, public callback: (state: T) => void) {}
}