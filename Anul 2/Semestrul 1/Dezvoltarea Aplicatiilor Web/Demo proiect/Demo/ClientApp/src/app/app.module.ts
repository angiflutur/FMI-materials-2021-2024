import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { JwtModule } from '@auth0/angular-jwt';

import { AppComponent } from './app.component';
import { AppRoutingModule } from './app-routing.module';
import { AuthModule } from './pages/auth/auth.module';
import { AdminModule } from './pages/admin/admin.module';


export function tokenGetter() {
  console.log(localStorage.getItem('token'))
  return localStorage.getItem('token');
}

@NgModule({
  declarations: [
    AppComponent,
  ],
  imports: [
    BrowserModule.withServerTransition({ appId: 'ng-cli-universal' }),
    HttpClientModule,
    FormsModule,
    AppRoutingModule,
    AdminModule,
    AuthModule,
    JwtModule.forRoot({
      config: {
        tokenGetter: tokenGetter,
        allowedDomains: ['localhost:1200', 'localhost:5071', 'localhost:7121', 'localhost:23792', 'localhost:44410', 'https://localhost:44410']
      }
    })
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
