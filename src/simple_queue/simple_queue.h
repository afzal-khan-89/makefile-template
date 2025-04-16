/*
 *  Simple_queue.h
 *
 *  Created on: Mar 17, 2023
 *  Author: afzal
 * 
 */

#ifndef _ble_msg_q_h_
#define _ble_msg_q_h_

#include <stdint.h>

#define  SM_QUEUE_STRUCT_SIZE   256


struct Qmsg;
typedef struct{
    int size ;
    struct Qmsg * q ;
}Simple_queue_t;

int create_msg_queue(Simple_queue_t * sm_q, uint16_t size );

int sm_q_push_msg(Simple_queue_t * sm_q, void * buffer, int size);

int sm_q_wait_for_msg(Simple_queue_t * sm_q, void * buffer);

#endif
