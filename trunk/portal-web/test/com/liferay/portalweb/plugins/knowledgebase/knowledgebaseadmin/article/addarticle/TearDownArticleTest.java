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

package com.liferay.portalweb.plugins.knowledgebase.knowledgebaseadmin.article.addarticle;

import com.liferay.portalweb.portal.BaseTestCase;
import com.liferay.portalweb.portal.util.RuntimeVariables;

/**
 * @author Brian Wing Shun Chan
 */
public class TearDownArticleTest extends BaseTestCase {
	public void testTearDownArticle() throws Exception {
		int label = 1;

		while (label >= 1) {
			switch (label) {
			case 1:
				selenium.open("/web/guest/home/");

				for (int second = 0;; second++) {
					if (second >= 60) {
						fail("timeout");
					}

					try {
						if (selenium.isElementPresent("link=Control Panel")) {
							break;
						}
					}
					catch (Exception e) {
					}

					Thread.sleep(1000);
				}

				selenium.saveScreenShotAndSource();
				selenium.clickAt("link=Control Panel",
					RuntimeVariables.replace("Control Panel"));
				selenium.waitForPageToLoad("30000");
				selenium.saveScreenShotAndSource();
				selenium.clickAt("link=Knowledge Base (Admin)",
					RuntimeVariables.replace("Knowledge Base (Admin)"));
				selenium.waitForPageToLoad("30000");
				selenium.saveScreenShotAndSource();

				boolean kbArticle1Present = selenium.isElementPresent(
						"_1_WAR_knowledgebaseportlet_rowIds");

				if (!kbArticle1Present) {
					label = 2;

					continue;
				}

				selenium.clickAt("//input[@name='_1_WAR_knowledgebaseportlet_allRowIds']",
					RuntimeVariables.replace("All Rows"));
				selenium.click(RuntimeVariables.replace(
						"//input[@value='Delete']"));
				selenium.waitForPageToLoad("30000");
				assertTrue(selenium.getConfirmation()
								   .matches("^Are you sure you want to delete the selected articles[\\s\\S]$"));
				selenium.saveScreenShotAndSource();

			case 2:

				boolean kbArticle2Present = selenium.isElementPresent(
						"_1_WAR_knowledgebaseportlet_rowIds");

				if (!kbArticle2Present) {
					label = 3;

					continue;
				}

				selenium.clickAt("//input[@name='_1_WAR_knowledgebaseportlet_allRowIds']",
					RuntimeVariables.replace("All Rows"));
				selenium.click(RuntimeVariables.replace(
						"//input[@value='Delete']"));
				selenium.waitForPageToLoad("30000");
				assertTrue(selenium.getConfirmation()
								   .matches("^Are you sure you want to delete the selected articles[\\s\\S]$"));
				selenium.saveScreenShotAndSource();

			case 3:

				boolean kbArticle3Present = selenium.isElementPresent(
						"_1_WAR_knowledgebaseportlet_rowIds");

				if (!kbArticle3Present) {
					label = 4;

					continue;
				}

				selenium.clickAt("//input[@name='_1_WAR_knowledgebaseportlet_allRowIds']",
					RuntimeVariables.replace("All Rows"));
				selenium.click(RuntimeVariables.replace(
						"//input[@value='Delete']"));
				selenium.waitForPageToLoad("30000");
				assertTrue(selenium.getConfirmation()
								   .matches("^Are you sure you want to delete the selected articles[\\s\\S]$"));
				selenium.saveScreenShotAndSource();

			case 4:

				boolean kbArticle4Present = selenium.isElementPresent(
						"_1_WAR_knowledgebaseportlet_rowIds");

				if (!kbArticle4Present) {
					label = 5;

					continue;
				}

				selenium.clickAt("//input[@name='_1_WAR_knowledgebaseportlet_allRowIds']",
					RuntimeVariables.replace("All Rows"));
				selenium.click(RuntimeVariables.replace(
						"//input[@value='Delete']"));
				selenium.waitForPageToLoad("30000");
				assertTrue(selenium.getConfirmation()
								   .matches("^Are you sure you want to delete the selected articles[\\s\\S]$"));
				selenium.saveScreenShotAndSource();

			case 5:

				boolean kbArticle5Present = selenium.isElementPresent(
						"_1_WAR_knowledgebaseportlet_rowIds");

				if (!kbArticle5Present) {
					label = 6;

					continue;
				}

				selenium.clickAt("//input[@name='_1_WAR_knowledgebaseportlet_allRowIds']",
					RuntimeVariables.replace("All Rows"));
				selenium.click(RuntimeVariables.replace(
						"//input[@value='Delete']"));
				selenium.waitForPageToLoad("30000");
				assertTrue(selenium.getConfirmation()
								   .matches("^Are you sure you want to delete the selected articles[\\s\\S]$"));
				selenium.saveScreenShotAndSource();

			case 6:
			case 100:
				label = -1;
			}
		}
	}
}