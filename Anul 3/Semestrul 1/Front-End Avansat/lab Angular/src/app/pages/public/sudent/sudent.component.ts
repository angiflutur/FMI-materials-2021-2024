import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-sudent',
  templateUrl: './sudent.component.html',
  styleUrls: ['./sudent.component.scss']
})
export class SudentComponent implements OnInit {
  public name: string = '';
  constructor(private activatedRoute: ActivatedRoute) { }

  ngOnInit(): void {
    this.activatedRoute.params.subscribe(params => {
      console.log('params', params);
      this.name = params['nume'];
    })
    this.activatedRoute.queryParams.subscribe(qParams => {
      console.log('qParams', qParams);
    })
  }
}
