import { TestBed } from '@angular/core/testing';
import { CanActivateFn } from '@angular/router';

import { publicGuard } from './public.guard';

describe('publicGuard', () => {
  const executeGuard: CanActivateFn = (...guardParameters) => 
      TestBed.runInInjectionContext(() => publicGuard(...guardParameters));

  beforeEach(() => {
    TestBed.configureTestingModule({});
  });

  it('should be created', () => {
    expect(executeGuard).toBeTruthy();
  });
});
