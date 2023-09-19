import { NgModule } from '@angular/core';

// Components
import { AdminComponent } from './admin/admin.component';
import { AdminHomeComponent } from './admin-home/admin-home.component';
import { AdminPage1Component } from './admin-page1/admin-page1.component';
import { AdminPage2Component } from './admin-page2/admin-page2.component';

// Modules
import { CommonModule } from '@angular/common';

// App Modules
import { AdminRoutingModule } from './admin-routing.module';

// Material Modules
import { MatCardModule } from '@angular/material/card';

@NgModule({
  declarations: [
    AdminComponent,
    AdminHomeComponent,
    AdminPage1Component,
    AdminPage2Component
  ],
  imports: [
    CommonModule,
    AdminRoutingModule,
    MatCardModule
  ]
})
export class AdminModule { }
