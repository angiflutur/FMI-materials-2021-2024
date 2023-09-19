import { Component, OnInit } from '@angular/core';
import { CommunicationService } from '../../../../core/services/communication/communication.service';

@Component({
  selector: 'app-comp2-c',
  templateUrl: './comp2-c.component.html',
  styleUrls: ['./comp2-c.component.scss']
})
export class Comp2CComponent implements OnInit {
  title = "component 1";

  constructor(private readonly communicationService: CommunicationService) { }

  ngOnInit(): void {
    this.communicationService.getTitleObservable().subscribe(data => {
      console.log('Component 2 title modification subscriber:', data);
      this.title = data;
    });
  }

  titleChanged() {
    this.communicationService.titleChanged('new title from component 2');
  }
}
