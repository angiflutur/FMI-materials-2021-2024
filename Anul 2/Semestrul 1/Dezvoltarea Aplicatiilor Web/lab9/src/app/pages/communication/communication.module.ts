import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { CommunicationComponent } from './communication.component';
import { CommunicationRoutingModule } from './communication-routing.module';
import { ContainerComponent } from './container/container.component';

// Components
import { ParentComponent } from './parent/parent.component';
import { ChildComponent } from './child/child.component';
import { Comp1CComponent } from './comp1-c/comp1-c.component';
import { Comp2CComponent } from './comp2-c/comp2-c.component';

@NgModule({
  declarations: [
    CommunicationComponent,
    ParentComponent,
    ChildComponent,
    Comp1CComponent,
    Comp2CComponent
  ],
  imports: [
    CommonModule,
    CommunicationRoutingModule
  ]
})
export class CommunicationModule { }
