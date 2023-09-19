import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AuthGuard } from './core/guards/auth.guard';
import { Page1Component } from './pages/page1/page1.component';
import { Page2Component } from './pages/page2/page2.component';
import { RegisterComponent } from './pages/register/register.component';

const routes: Routes = [{
    path: "page1",
    component: Page1Component
  },
  {
    path: "page2",
    component: Page2Component
  },
  {
    path: "register",
    component: RegisterComponent
  },
  {
    path: "admin",
    canActivate: [AuthGuard],
    loadChildren: () => import('./pages/admin/admin.module').then(m => m.AdminModule)
  }];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
