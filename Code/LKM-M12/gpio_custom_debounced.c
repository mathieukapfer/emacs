/*
 *  Driver for debouncing a gpio input with specific timer value for rising and
 *  falling edge. This is called asymetric debouned.
 *
 *  Copyright (C) 2016 Mathieu Kapfer mathieu.kapfer@gmail.com>
 *
 *  This file was on: /drivers/input/keyboard/gpio_keys.c
 *	Copyright 2005 Phil Blundell
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License version 2 as
 *  published by the Free Software Foundation.
 */

#define DEBUG

#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/slab.h>
#include <linux/input.h>
//#include <linux/input-polldev.h>
#include <linux/ioport.h>
#include <linux/platform_device.h>
#include <linux/gpio.h>
//#include <linux/gpio/consumer.h>
//#include <linux/gpio_keys.h>
#include <linux/property.h>

#include "log.h"

#define DRV_NAME	"gpio-custom-debounced"

struct gpio_custom_debounced {
	int state;
	int rising_edge_debounce_timer;
	int falling_edge_debounce_timer;
};

static const struct of_device_id gpio_custom_debounced_of_match[] = {
	{ .compatible = "gpio-custom-debounced", },
	{ },
};
MODULE_DEVICE_TABLE(of, gpio_custom_debounced_of_match);

static int gpio_custom_debounced_probe(struct platform_device *pdev)
{
	struct device *dev = &pdev->dev;
  /* TODO */
  LOG_ENTER;

  return 0;
}

static int gpio_custom_debounced_remove(struct platform_device *pdev)
{
	struct device *dev = &pdev->dev;
  /* TODO */
  LOG_ENTER;

  return 0;
}

static struct platform_driver gpio_custom_debounced_driver = {
	.probe	= gpio_custom_debounced_probe,
	.remove	= gpio_custom_debounced_remove,
	.driver	= {
		.name	= DRV_NAME,
		.of_match_table = gpio_custom_debounced_of_match,
	},
};

module_platform_driver(gpio_custom_debounced_driver);

MODULE_LICENSE("GPL v2");
MODULE_AUTHOR("Mathieu Kapfer <mathieu.kapfer@gmail.com>");
MODULE_DESCRIPTION("GPIO Custom debounced ");
MODULE_ALIAS("platform:" DRV_NAME);
