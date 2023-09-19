import { Injectable } from '@angular/core';
import { AsyncSubject, BehaviorSubject, ReplaySubject, Subject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class CommunicationService {
  private titleBehaviorSubject = new BehaviorSubject<string>("");
  private titleSubject = new Subject<string>();
  private titleAsyncSubject = new AsyncSubject<string>();
  private titleReplaySubject = new ReplaySubject<string>();

  constructor() { }

  titleChanged(value: string) {
    this.titleBehaviorSubject.next(value);
  }

  getTitleObservable() {
    return this.titleBehaviorSubject.asObservable();
  }
}
