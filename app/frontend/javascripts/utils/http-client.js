import axiosBase from 'axios';
import { csrfToken } from 'rails-ujs';

export const axios = axiosBase.create({
  baseURL: 'http://localhost:3000/api',
  responseType: 'json',
  headers: {
    'X-CSRF-Token': csrfToken(),
  },
});
