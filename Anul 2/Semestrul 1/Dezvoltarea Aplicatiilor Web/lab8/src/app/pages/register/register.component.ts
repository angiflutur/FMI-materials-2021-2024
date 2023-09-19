import { Component, OnInit } from '@angular/core';
import { FormBuilder, Validators } from '@angular/forms';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.scss']
})
export class RegisterComponent implements OnInit {
  public registerForm = this.formBuilder.group({
    userName: ['', Validators.required],
    email: ['', Validators.email],
    password: ['', Validators.required]
  });
  public hide: Boolean = true;

  // extra
  public imageUrl = 'https://thescranline.com/wp-content/uploads/2021/03/Vanilla-Cupcakes';
  public value = '2';

  constructor(private readonly formBuilder: FormBuilder) { }

  ngOnInit(): void {
  }

  checkForm() {
    console.log(this.registerForm.value);
    this.getFormValidationError(['userName', 'email']);
  }

  getFormValidationError(keys: any) {
    keys.forEach((key: any) => {
      const controlErrors = this.registerForm.get(key)?.errors;
      if (controlErrors != null) {
        console.error(key + ' has errors: ' + controlErrors);
      }
    })
  }

}
