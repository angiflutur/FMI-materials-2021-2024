import { Component, OnInit } from '@angular/core';
import { FormBuilder, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { AuthService } from '../../../core/services/auth.service';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent implements OnInit {
  public registerForm = this.formBuilder.group({
    email: ['', Validators.email],
    firstName: ['', Validators.required],
    lastName: ['', Validators.required],
    password: ['', Validators.required]
  });

  constructor(private readonly formBuilder: FormBuilder, private router: Router, private readonly authService: AuthService) { }

  ngOnInit(): void {
  }

  register() {
    this.authService.register(this.registerForm.value).subscribe(data => {
      console.log(data);
      this.router.navigate(['login']);
    });
  }
}
