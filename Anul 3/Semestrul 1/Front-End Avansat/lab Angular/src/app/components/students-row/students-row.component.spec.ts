import { ComponentFixture, TestBed } from '@angular/core/testing';

import { StudentsRowComponent } from './students-row.component';

describe('StudentsRowComponent', () => {
  let component: StudentsRowComponent;
  let fixture: ComponentFixture<StudentsRowComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [StudentsRowComponent]
    });
    fixture = TestBed.createComponent(StudentsRowComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
