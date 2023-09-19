import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { Demo1Component } from './pages/demo1/demo1.component';
import { Demo2Component } from './pages/demo2/demo2.component';

const routes: Routes = [
  {
    path: "demo1",
    component: Demo1Component
  },
  {
    path: "demo2/:id",
    component: Demo2Component
  }
  ];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
