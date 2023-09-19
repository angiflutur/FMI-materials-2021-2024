import { Component, OnInit } from '@angular/core';
import { CommunicationService } from '../../../../core/services/communication/communication.service';

@Component({
  selector: 'app-comp1-c',
  templateUrl: './comp1-c.component.html',
  styleUrls: ['./comp1-c.component.scss']
})
export class Comp1CComponent implements OnInit {
  title = "component 1";

  constructor(private readonly communicationService: CommunicationService) { }

  ngOnInit(): void {
    this.communicationService.getTitleObservable().subscribe(data => {
      console.log('Component 2 title modification subscriber:', data);
      this.title = data;
    });
  }

  titleChanged() {
    this.communicationService.titleChanged('new title from component 1');
  }
}
