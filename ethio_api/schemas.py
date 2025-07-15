from pydantic import BaseModel
from typing import Optional
from datetime import datetime

class ProductReport(BaseModel):
    product_name: Optional[str]
    mention_count: Optional[int]

#class ProductReport(BaseModel):
    #product_name: str
    #mention_count: int

class ChannelActivity(BaseModel):
    channel_name: str
    daily_post_count: int
    weekly_post_count: int


class MessageSearch(BaseModel):
    message_id: int
    message: str
    channel_name: str
    message_date: datetime

    class Config:
        orm_mode = True

