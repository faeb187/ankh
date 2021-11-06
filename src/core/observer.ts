import { twoDollars as $$ } from "twodollars";
import { AnyObject } from "types/basic.type";

type Observer = {
  l: (event: ObserverEvent) => Observer;
  f: (eventName: string, dynamicArgs?: AnyObject) => Observer;
  r: (eventName?: string) => Observer;
  p: () => Observer;
};

export type ObserverEvent = {
  args?: AnyObject;
  bind?: {
    target: HTMLElement | string;
    type: string;
  };
  name: string;
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  handler?: (...args: any[]) => void;
};

let evs: ObserverEvent[] = [];

export const observer: Observer = {
  l: (event: ObserverEvent): Observer => {
    const { args, bind, name } = event;

    if (bind) {
      const { target, type } = bind;
      const $target = typeof target === "string" ? $$.find(target)[0] : target;

      $target.addEventListener(type, (event: Event) => {
        console.log("fire args:", { ...args, event });
        observer.f(name, { ...args, event });
      });
    }
    evs.push(event);

    return observer;
  },

  f: (eventName: string, dynamicArgs: AnyObject = {}): Observer => {
    const matchedEvents = evs.filter(
      (ev: ObserverEvent) => ev.name === eventName
    );
    matchedEvents.forEach((matchedEvent: ObserverEvent) => {
      const { args = {}, handler } = matchedEvent;
      handler && handler({ ...args, ...dynamicArgs });
    });
    return observer;
  },

  r: (eventName?: string): Observer => {
    evs = evs.filter((ev: ObserverEvent) =>
      eventName ? ev.name === eventName : ev.name[0] !== "_"
    );
    return observer;
  },

  p: (): Observer => {
    console.log(evs.length, evs);
    return observer;
  },
};
