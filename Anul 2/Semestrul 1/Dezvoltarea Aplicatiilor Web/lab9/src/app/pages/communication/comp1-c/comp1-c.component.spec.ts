import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Comp1CComponent } from './comp1-c.component';

describe('Comp1CComponent', () => {
  let component: Comp1CComponent;
  let fixture: ComponentFixture<Comp1CComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ Comp1CComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(Comp1CComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
