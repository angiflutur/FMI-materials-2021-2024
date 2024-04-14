import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SudentComponent } from './sudent.component';

describe('SudentComponent', () => {
  let component: SudentComponent;
  let fixture: ComponentFixture<SudentComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [SudentComponent]
    });
    fixture = TestBed.createComponent(SudentComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
