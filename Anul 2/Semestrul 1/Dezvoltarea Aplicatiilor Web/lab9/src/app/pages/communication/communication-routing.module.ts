import { NgModule } from '@angular/core';
import { CommunicationComponent } from './communication.component';
import { RouterModule, Routes } from '@angular/router';

const routes: Routes = [{path: '', component: CommunicationComponent}]

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class CommunicationRoutingModule { }
