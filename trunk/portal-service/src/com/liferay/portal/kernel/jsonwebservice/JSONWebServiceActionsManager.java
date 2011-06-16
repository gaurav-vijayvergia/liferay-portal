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

package com.liferay.portal.kernel.jsonwebservice;

import java.lang.reflect.Method;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

/**
 * @author Igor Spasic
 */
public interface JSONWebServiceActionsManager {

	public List<String[]> dumpMappings();

	public JSONWebServiceAction lookup(HttpServletRequest request);

	public void registerJSONWebServiceAction(
		Class<?> actionClass, Method actionMethod, String path, String method);

}