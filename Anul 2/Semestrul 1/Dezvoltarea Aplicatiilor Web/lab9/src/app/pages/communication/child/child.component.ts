import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';

@Component({
  selector: 'app-child',
  templateUrl: './child.component.html',
  styleUrls: ['./child.component.scss']
})
export class ChildComponent implements OnInit {
  @Input() title = '';
  @Output() titleChanged = new EventEmitter();

  constructor() { }

  ngOnInit(): void {
  }

  changeTitle() {
    this.title = 'new title from child';
    this.titleChanged.emit(this.title);
  }
}
