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
#include <linux/interrupt.h>
#include <linux/irq.h>
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
  int gpio;
	int state;
	int debounce_timer_rising_edge;
	int debounce_timer_falling_edge;
  const char * label;
  int irq;
};

/* TODO: to be replaced by devtree data */
static struct gpio_custom_debounced my_gpio = {
  //.gpio = 69, /* presence -12V: PC05 = 32*2 + 5*/
  .gpio = 56, /* micro-switch 1: PB24 = 32 + 24 =*/
  .debounce_timer_rising_edge = 1,
  .debounce_timer_falling_edge = 0,
  .label = "presence-M12V",
};

static const struct of_device_id gpio_custom_debounced_of_match[] = {
	{ .compatible = "gpio-custom-debounced", },
	{ },
};
MODULE_DEVICE_TABLE(of, gpio_custom_debounced_of_match);


static irqreturn_t gpio_custom_debounced_edge_isr(int irq, void *dev_id)
{
  struct gpio_custom_debounced *my_gpio =  dev_id;
  int state = gpio_get_value_cansleep(my_gpio->gpio);

  LOG_INFO("state of %d is %d", my_gpio->gpio, state);

  return IRQ_HANDLED;
}



static int gpio_custom_debounced_probe(struct platform_device *pdev)
{
	struct device *dev = &pdev->dev;
	int irq;
  int error;

  /* TODO */
  LOG_ENTER;

  /* request gpio */
  error = devm_gpio_request_one(&pdev->dev, my_gpio.gpio,
					      GPIOF_IN, my_gpio.label);

  if (error < 0) {
    dev_err(dev, "Failed to request GPIO %d, error %d\n",
            my_gpio.gpio, error);
    return error;
  }

  dev_info(dev, "GPIO %d requested", my_gpio.gpio);

  /* get irq number */
  irq = gpio_to_irq(my_gpio.gpio);
  if (irq < 0) {
    error = irq;
    dev_err(dev,
					"Unable to get irq number for GPIO %d, error %d\n",
            my_gpio.gpio, error);
    return error;
  }
  my_gpio.irq = irq;

  dev_info(dev, "IRQ %d requested", my_gpio.irq);

  /* install irs */
  error = devm_request_any_context_irq
    (&pdev->dev, irq,
     gpio_custom_debounced_edge_isr,
     IRQF_TRIGGER_NONE, /* Keep HW default capability: in SAM9G20 it will be RISING | FALLING  */
     my_gpio.label, &my_gpio);

	if (error < 0) {
		dev_err(dev, "Unable to claim irq %d; error %d\n",
			irq, error);
		return error;
	}

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
