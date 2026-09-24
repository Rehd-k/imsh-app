# Prompt 0 — Design system (Vivid Care)

Paste this **first**. It is a sticker sheet, not a product screen.

```
Design a mobile iOS visual-language STICKER SHEET (not a product screen) for IMSH Patient Portal — Ibom Specialist Hospital, Uyo, Nigeria.

Name the system VIVID CARE. It must look OVERLY COLORFUL on purpose: a festival of care. Think Superapp + children’s hospital mural + Lagos fashion week, applied to a real adult patient app. Saturated. Joyful. Photo-heavy. Motion everywhere.

Device: iPhone 15, 390×844, light mode. Rounded fun sans (like Nunito / Plus Jakarta / rounded Inter). Native iOS frame, not a website.

COLOR EXPLOSION — use ALL of these on the same board, no muted navy-only look:
- Hot coral #FF4D6D
- Sunset orange #FF8A00
- Sunshine yellow #FFD23F
- Lime #7CFF6B
- Aqua mint #00E5C3
- Electric blue #3B82FF
- IMSH navy #00478D (identity stripe only, never the whole UI)
- Violet #8B5CF6
- Magenta #FF2D95
- Soft canvas is NOT gray: a peach-to-mint-to-lavender mesh gradient background with floating translucent blobs
- Text on light: #1A1033 (deep purple-black, not gray)
- Text on neon: white with a slight drop shadow so it stays readable

PHOTOGRAPHY (lots, full-bleed, West African hospital):
- Medical laboratory: centrifuges, rainbow reagent tubes, microscope, lab coats
- Hospital pharmacy: colorful medicine boxes on shelves, pharmacist counting pills
- Hospital lobby with bright art and waiting chairs
- Nurses station, ward corridor with colored doors
- Ambulance bay, MRI / radiology suite
- West African doctors, nurses, pharmacists, lab scientists, patients
No empty beige rooms. No cartoon clipart instead of photos. Photos + bright shapes layered on top.

MOTION / MICRO-INTERACTIONS to illustrate on the board with little spark arrows and onion-skin frames:
- Bounce on icon press (scale 1.0 → 0.92 → 1.06)
- Shimmer sweep across every primary button
- Pulse glow on Emergency (coral ring breathing)
- Horizontal STORY SLIDES / carousels that peek 28px of the next card
- Floating photo bubbles that drift slowly
- Confetti burst sketch for success
- Tab bar icon wiggle on select
- Skeleton cards that rainbow-shimmer while loading
- Slide-up sheets with a colorful grab handle
- Progress that fills with a gradient, not a gray bar

TYPE:
- Display 34pt extra-bold rounded, often in a gradient fill (coral → violet)
- Titles 22pt bold
- Body 16pt
- Stickers / badges 11pt bold, ALL colorful pills, never gray chips

COMPONENTS TO DRAW, labeled, crowded and festive:

1. Mesh-gradient canvas with 5 floating photo bubbles: lab, pharmacy, ambulance, MRI, smiling nurse.
2. App bar: circular patient photo with a MAGENTA ring, rainbow wordmark “Ibom Specialist” (each word a different color), bell icon with a bouncing sunshine-yellow badge “3”.
3. Five-tab bar, EACH tab a different color: Home coral, Records violet, Booking aqua, Billing sunshine, Account magenta. Selected tab is a big candy pill. Unselected still colorful, never gray.
4. Buttons: coral filled with shimmer, orange outline, lime success, violet ghost, MAGENTA emergency with pulse rings.
5. Status stickers: Confirmed lime, Pending sunshine, Critical magenta, Paid aqua, Due orange, Dispatched electric blue — chunky, 3D-ish, slight bounce shadow.
6. Input: thick 3px coral-to-violet gradient border, sunshine placeholder, bouncing cursor.
7. Filter chips as candy: All (blue), Abnormal (orange), Critical (magenta), each with a tiny photo thumbnail inside the chip.
8. Next-visit HERO as a horizontal SLIDE: card 1 photo of cardiology clinic, card 2 photo of pharmacy, card 3 photo of lab — peek the next slide. Gradient overlay coral→violet, white type.
9. Icon wells: 56pt squircle, each a different neon, with a mini photo or colorful 3D-ish medical object (pill bottle, test tube, heart, syringe, QR).
10. Motion legend: 6 tiny storyboard frames showing a card sliding in from the right with a bounce.

Do not make it calm, beige, Apple-Health-minimal, or navy corporate. If a component is not colorful, it is wrong. Overdo color, photos, slides, and micro-interaction annotations.
```
# How to use these Stitch prompts

One **page** = one **paste** into [Google Stitch](https://stitch.withgoogle.com).

**Product:** Ibom Specialist Hospital patient portal (patients only).  
**Patient:** Mrs. Aniekan Udo, ID `ISH-2024-4821`, Uyo, Nigeria.  
**Look:** **Vivid Care** — overly colorful, packed with real hospital / lab / pharmacy photos, sliding carousels, bouncing icons, shimmer buttons, pulse glows.

## Steps

1. Stitch → **New project** → **Mobile**.
2. Open [00-design-system.md](00-design-system.md). Copy the prompt. Generate first.
3. Open **01**, then **02**, then **03**… Copy each page’s prompt. Stay in the **same project**.
4. Every screen prompt already starts with: *Same IMSH Vivid Care design system…*
5. If a flow has extra steps (booking wizard), use the **Follow-up** lines on that page.

## If Stitch is too quiet, append this

`Make it OVERLY colorful. More gradients. More photos of labs, pharmacy shelves, hospital corridors, and ambulances. Add sliding carousels that peek the next card. Add bounce, pulse, and shimmer micro-interactions. No beige. No flat navy-only UI.`

## Other rescue lines

| Problem | Append |
|---------|--------|
| Looks like a website | `Native iOS phone app, not a website. No browser chrome.` |
| Too gray / too Apple Health | `Reject muted palettes. Use coral, sunshine, lime, aqua, violet, magenta, and electric blue in the same screen.` |
| No photos | `Fill heroes with real photographs: medical laboratory, hospital pharmacy, nurses station, MRI suite, colorful lobby.` |
| No motion | `Show swipe slides, stacked story cards, pulsing CTAs, floating photo bubbles, and motion streaks. Annotate animations on the mock.` |
| Generic US hospital | `Nigerian private hospital in Uyo. Naira ₦. West African staff and patients. IDs like ISH-2024-4821.` |
| Missing tabs | `Five-tab bar: Home, Records, Booking, Billing, Account. Each tab icon is a different bright color.` |
