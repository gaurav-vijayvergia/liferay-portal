/**
 * Copyright (c) 2000-2011 Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */

package com.liferay.portal;

import com.liferay.portal.kernel.exception.PortalException;

/**
 * @author Raymond Augé
 */
public class RemoteOptionsException extends PortalException {

	public static final int REMOTE_ADDRESS = 1;

	public static final int REMOTE_GROUP_ID = 3;

	public static final int REMOTE_PORT = 2;

	public RemoteOptionsException(int type) {
		_type = type;
	}

	public String getRemoteAddress() {
		return _remoteAddress;
	}

	public long getRemoteGroupId() {
		return _remoteGroupId;
	}

	public int getRemotePort() {
		return _remotePort;
	}

	public int getType() {
		return _type;
	}

	public void setRemoteAddress(String remoteAddress) {
		_remoteAddress = remoteAddress;
	}

	public void setRemoteGroupId(long remoteGroupId) {
		_remoteGroupId = remoteGroupId;
	}

	public void setRemotePort(int remotePort) {
		_remotePort = remotePort;
	}

	private String _remoteAddress;
	private long _remoteGroupId;
	private int _remotePort;
	private int _type;

}