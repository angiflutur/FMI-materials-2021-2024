import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { StudentsRowComponent } from './components/students-row/students-row.component';
import { LoginComponent } from './pages/public/login/login.component';
import { RegisterComponent } from './pages/public/register/register.component';
import { SudentComponent } from './pages/public/sudent/sudent.component';
import { DashboardComponent } from './pages/private/dashboard/dashboard.component';

@NgModule({
  declarations: [
    AppComponent,
    StudentsRowComponent,
    LoginComponent,
    RegisterComponent,
    SudentComponent,
    DashboardComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
