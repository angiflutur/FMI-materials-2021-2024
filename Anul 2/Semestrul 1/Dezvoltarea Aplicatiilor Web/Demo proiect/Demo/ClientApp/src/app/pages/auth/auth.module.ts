import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

// Components
import { RegisterComponent } from './register/register.component';
import { LoginComponent } from './login/login.component';

// Modules
import { AuthRoutingModule } from './auth-routing.module';
import { MatListModule } from '@angular/material/list';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { MatButtonModule, MatCardModule, MatFormFieldModule, MatIconModule } from '@angular/material';
import { MatInputModule } from '@angular/material/input';

@NgModule({
  declarations: [LoginComponent, RegisterComponent],
  imports: [
    CommonModule,
    AuthRoutingModule,
    CommonModule,
    MatListModule,
    ReactiveFormsModule,
    MatCardModule,
    MatFormFieldModule,
    MatIconModule,
    MatButtonModule,
    FormsModule,
    MatInputModule
  ]
})
export class AuthModule { }
