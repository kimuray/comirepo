import axiosBase from 'axios';
import { csrfToken } from 'rails-ujs';

console.log(csrfToken())
export const axios = axiosBase.create({
  baseURL: 'https://kuriyama-app.herokuapp.com/api',
  responseType: 'json',
  headers: {
    'X-CSRF-Token': csrfToken(),
  },
});
