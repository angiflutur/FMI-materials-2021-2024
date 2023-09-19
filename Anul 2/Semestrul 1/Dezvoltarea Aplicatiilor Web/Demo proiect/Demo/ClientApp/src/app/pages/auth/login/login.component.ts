import { Component, OnInit } from '@angular/core';
import { FormBuilder, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { AuthService } from '../../../core/services/auth.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  public loginForm = this.formBuilder.group({
    email: ['', Validators.email],
    password: ['', Validators.required]
  });

  constructor(private readonly formBuilder: FormBuilder, private router: Router, private readonly authService: AuthService) { }

  ngOnInit(): void {
  }

  login() {
    this.authService.login(this.loginForm.value).subscribe(data => {
      console.log(data);
      this.router.navigate(['admin/dashboard/courses']);
    })
  }

}
