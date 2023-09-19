import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AdminPage2Component } from './admin-page2.component';

describe('AdminPage2Component', () => {
  let component: AdminPage2Component;
  let fixture: ComponentFixture<AdminPage2Component>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AdminPage2Component ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(AdminPage2Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
