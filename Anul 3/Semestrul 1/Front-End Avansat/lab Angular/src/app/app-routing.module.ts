import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LoginComponent } from './pages/public/login/login.component';
import { RegisterComponent } from './pages/public/register/register.component';
import { SudentComponent } from './pages/public/sudent/sudent.component';
import { DashboardComponent } from './pages/private/dashboard/dashboard.component';
import { publicGuard } from './guards/public.guard';
import { privateGuard } from './guards/private.guard';

const routes: Routes = [
  { path: '', redirectTo: '/public/login', pathMatch: 'full' },
  {
    path: 'public',
    children: [
      {
        path: 'login',
        component: LoginComponent,
        canActivate: [publicGuard]
      },
      {
        path: 'register',
        component: RegisterComponent,
        canActivate: [publicGuard]
      },
      {
        path: 'student/:nume',
        component: SudentComponent,
        canActivate: [publicGuard]
      }
    ]
  },
  {
    path: 'private',
    children: [
      {
        path: 'dashboard',
        component: DashboardComponent,
        canActivate: [privateGuard]
      }
    ]
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
