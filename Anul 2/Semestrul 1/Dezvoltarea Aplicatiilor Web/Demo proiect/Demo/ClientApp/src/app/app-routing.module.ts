import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AuthGuard } from './core/guards/auth.guard';
import { HomeComponent } from './pages/home/home.component';

const routes: Routes = [{
  path: 'home',
  component: HomeComponent
},
  {
    path: "admin",
   // canActivate: [AuthGuard],
    loadChildren: () => import('./pages/admin/admin.module').then(m => m.AdminModule)
  },
  {
    path: "auth",
    loadChildren: () => import('./pages/auth/auth.module').then(m => m.AuthModule)
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
