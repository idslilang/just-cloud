package com.cloud.just.common.core.exception;

import lombok.NoArgsConstructor;

@NoArgsConstructor
public class JustDeniedException extends RuntimeException {

	private static final long serialVersionUID = 1L;

	public JustDeniedException(String message) {
		super(message);
	}

	public JustDeniedException(Throwable cause) {
		super(cause);
	}

	public JustDeniedException(String message, Throwable cause) {
		super(message, cause);
	}

	public JustDeniedException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

}
