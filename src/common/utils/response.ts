import { Response } from 'express';

export const sendResponse = (
  res: Response,
  code: number,
  message: string,
  data?: any,
) => {
  return res.status(code).json({
    code,
    message,
    ...(data && { data }),
  });
};
