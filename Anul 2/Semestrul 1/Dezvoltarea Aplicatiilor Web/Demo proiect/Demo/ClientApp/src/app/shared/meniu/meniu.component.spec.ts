import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MeniuComponent } from './meniu.component';

describe('MeniuComponent', () => {
  let component: MeniuComponent;
  let fixture: ComponentFixture<MeniuComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ MeniuComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(MeniuComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
