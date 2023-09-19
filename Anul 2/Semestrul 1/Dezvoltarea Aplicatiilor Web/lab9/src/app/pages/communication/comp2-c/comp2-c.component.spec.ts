import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Comp2CComponent } from './comp2-c.component';

describe('Comp2CComponent', () => {
  let component: Comp2CComponent;
  let fixture: ComponentFixture<Comp2CComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ Comp2CComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(Comp2CComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
