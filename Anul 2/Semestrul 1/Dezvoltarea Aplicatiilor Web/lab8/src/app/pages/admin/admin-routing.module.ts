import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule, Routes } from '@angular/router';

// Components
import { AdminComponent } from './admin/admin.component';
import { AdminHomeComponent } from './admin-home/admin-home.component';
import { AdminPage1Component } from './admin-page1/admin-page1.component';
import { AdminPage2Component } from './admin-page2/admin-page2.component';


const routes: Routes = [{
    path: "",
    component: AdminComponent,
    children: [
      {
        path: "page1",
        component: AdminPage1Component
      },
      {
        path: "page2",
        component: AdminPage2Component
      }
    ]
  },
  {
    path: "home",
    component: AdminHomeComponent
  }]

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AdminRoutingModule { }
