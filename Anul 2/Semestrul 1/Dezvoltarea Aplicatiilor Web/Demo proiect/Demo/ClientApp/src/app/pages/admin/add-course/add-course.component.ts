import { Component, OnInit } from '@angular/core';
import { FormBuilder, Validators } from '@angular/forms';
import { CourseService } from '../../../core/services/course.service';

@Component({
  selector: 'app-add-course',
  templateUrl: './add-course.component.html',
  styleUrls: ['./add-course.component.css']
})
export class AddCourseComponent implements OnInit {
  public courseForm = this.formBuilder.group({
    title: ['', Validators.required],
    description: ['', Validators.email],
    maximumStudentsAllowed: [0, Validators.required]
  });

  constructor(private readonly formBuilder: FormBuilder, private readonly courseService: CourseService) { }

  ngOnInit(): void {
  }

  checkForm() {
    if (this.getFormValidationError(['title', 'description', 'maximumstudentsallowed'])) {
      this.courseService.addNewCourse(this.courseForm.value).subscribe(data => console.log(data))
    }
  }

  getFormValidationError(keys: any) {
    return keys.forEach((key: any) => {
      const controlErrors = this.courseForm.get(key)?.errors;
      if (controlErrors != null) {
        console.error(key + ' has errors: ' + controlErrors);
        return false;
      }
      return true;
    });
  }

}
