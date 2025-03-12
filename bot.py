import telebot
import os

# دریافت توکن از متغیر محیطی
BOT_TOKEN = os.getenv("BOT_TOKEN")

bot = telebot.TeleBot(BOT_TOKEN)

@bot.message_handler(commands=['start'])
def send_welcome(message):
    bot.reply_to(message, "سلام! من دستیار اورب هستم. چطور کمکتون کنم؟")

@bot.message_handler(func=lambda message: True)
def echo_all(message):
    bot.reply_to(message, "پیام شما دریافت شد: " + message.text)

if __name__ == "__main__":
    bot.polling()
